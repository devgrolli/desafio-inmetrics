require 'report_builder'

$page_inmetrics = PageInmetrics::Pages
$screenshot_counter = 1

def normalize_file_name(file_name = '')
  file_name
    .to_s
    .gsub(/[^0-9A-Za-z_\-]/, '_')
    .gsub(/_{2,}/, '_')
    .gsub(/_$/, '')
    .downcase
end

def take_screenshot(file_name = '', status = :passed)
  file_extension = '.png'
  file_name_normalized = normalize_file_name file_name
  status_normalized = normalize_file_name status
  file_name_prefix = $screenshot_counter.to_s + status_normalized + (
    file_name_normalized.empty? ? '' : '_'
  )
  file_path = "reports/screenshots/" + file_name_prefix + file_name_normalized + file_extension
  Capybara.page.save_screenshot(file_path)
  encoded_image = Base64.encode64(image = open(file_path, 'rb', &:read))
  embed(encoded_image, 'image/png;base64', 'SCREENSHOT')
  $screenshot_counter += 1
end

def class_name(object)
  object.class.name.split('::').last
end

def status_from_result(result)
  class_name result
end

AfterStep do |result, step|
  begin
    status_name = status_from_result result
    take_screenshot(step.text, status_name)
  rescue StandardError => exception
    puts exception
  end
end

at_exit do
  time = Time.now.getutc
  time.localtime
  date = (DateTime.now).to_date
  date = date.to_s
  date = Date.strptime(date, '%Y-%m-%d')

  ReportBuilder.configure do |config|
    nome = 'Inmetrics'
    config.encoding = "utf-8"
    Encoding.default_external = 'UTF-8'
    Encoding.default_internal = 'UTF-8'
    Encoding::UTF_8
    config.input_path = "reports/"
    config.report_path = "reports/cucumber_web_report"
    config.report_types = [:html]
    config.report_title = nome
    config.color = 'grey'
    config.include_images = true
    config.additional_css = 'features\support\css_report_builder.css'
    config.additional_info = {
      'URL' => URL['urls'],
      'Projeto' => nome,
    }
  end
  ReportBuilder.build_report
end

def clear_screenshots
  files = Dir.glob("reports/screenshots/*")
  time = RUN_TSTAMP[0..-4]
  files.each do |file|
    unless file.match(/#{time}/)
      FileUtils.remove_dir(file, force = true)
    end
  end
end