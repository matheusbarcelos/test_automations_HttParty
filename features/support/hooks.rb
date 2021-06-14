require 'report_builder'

at_exit do
    ReportBuilder.configure do |config|
      config.input_path = 'reports/cucumber.json'
      config.report_path = 'reports/report'
      config.report_types = [:json, :html]
    end
    ReportBuilder.build_report
  end