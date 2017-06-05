require 'google/apis/sheets_v4'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'active_support'
require 'active_support/core_ext'

require 'fileutils'

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
APPLICATION_NAME = 'Google Sheets API Ruby Quickstart'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "sheets.googleapis.com-ruby-quickstart.yaml")
SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(
      base_url: OOB_URI)
    puts "Open the following URL in the browser and enter the " +
         "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI)
  end
  credentials
end

# Initialize the API
service = Google::Apis::SheetsV4::SheetsService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize

# A shit load of arrays for Response
$companyNumbers = Array.new
$howManyCompanies = 0

$companyNames = Array.new
$legalNames = Array.new
$companyRanks = Array.new
$companyInvestDate = Array.new
$companySecurityType = Array.new
$companyRoundSize = Array.new
$companyRoundSizeAdjusted = Array.new
$companyAmountInvested = Array.new
$companyAmountInvestedAdjusted = Array.new
$companyCurrentValue = Array.new
$companyCurrentValueAdjusted = Array.new
$companyGainLossAdjusted = Array.new
$companyNumShares = Array.new
$companyInitialPPS = Array.new
$companyCurrentPPS = Array.new
$companyCap = Array.new
$companyCurrentValuation = Array.new
$howManyCompanies = 0
$companyComments = Array.new

# A shit load of arrays for Response2
$fundIRR = Array.new
$fundTVPI = Array.new
$fundNAV = Array.new
$fundComCap = Array.new
$fundCallCap = Array.new
$fundCallPer = Array.new
$fundPortfolio = Array.new
$fundInvAmt = Array.new
$fundInvFMV = Array.new

$fund2015Q3 = Array.new
$fund2015Q4 = Array.new
$fund2016Q1 = Array.new
$fund2016Q2 = Array.new
$fund2016Q3 = Array.new
$fund2016Q4 = Array.new

# Goes through the Dummy Data for 500 Startups
# Prints the names and majors of students in a sample spreadsheet:
# https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
spreadsheet_id = '100jCQ9_lf0laidYNRKIUcGG7guLvoYkvJeRn6FECQM4'
range = 'Valuations!A2:AB'
range2 = 'Performance By Quarter!B3:O'
response = service.get_spreadsheet_values(spreadsheet_id, range)
response2 = service.get_spreadsheet_values(spreadsheet_id, range2)
# puts 'Legal, Invested:'
# puts 'No data found.' if response.values.empty?

tempName = ""

response.values.each do |row|

  if (!(row[1].blank?))
    $companyNumbers.push("#{row[1]}")
  end
  $howManyCompanies = $companyNumbers[-1].to_i

  if (!(row[2].blank?))
    if (row[2] != tempName)
      $companyNames.push("#{row[2]}")
      tempName = row[2]
    end
  end

  if (!(row[3].blank?))
    $legalNames.push("#{row[3]}")
  end

  if (!(row[4].blank?))
    $companyRanks.push("#{row[4]}")
  end

  if (!(row[5].blank?))
    $companyInvestDate.push("#{row[5]}")
  end

  if (!(row[9].blank?))
    $companySecurityType.push("#{row[9]}")
  end

  if (!(row[10].blank?))
    $companyRoundSize.push("#{row[10]}")
  end

  if (!(row[11].blank?))
    $companyRoundSizeAdjusted.push("#{row[11]}")
  end

  if (!(row[12].blank?))
    $companyAmountInvested.push("#{row[12]}")
  end

  if (!(row[13].blank?))
    $companyAmountInvestedAdjusted.push("#{row[13]}")
  end

  if (!(row[14].blank?))
    $companyCurrentValue.push("#{row[14]}")
  end

  if (!(row[15].blank?))
    $companyCurrentValueAdjusted.push("#{row[15]}")
  end

  if (!(row[16].blank?))
    $companyGainLossAdjusted.push("#{row[16]}")
  end

  if (!(row[17].blank?))
    $companyNumShares.push("#{row[17]}")
  end

  if (!(row[18].blank?))
    $companyInitialPPS.push("#{row[18]}")
  end

  if (!(row[19].blank?))
    $companyCurrentPPS.push("#{row[19]}")
  end

  if (!(row[20].blank?))
    $companyCap.push("#{row[20]}")
  end

  if (!(row[22].blank?))
    asdf = row[22]
    asdf[0] = "0"
    asdf = asdf.tr(',', '')
    asdf = asdf.to_i

    $companyCurrentValuation.push(asdf)
  end

  if (!(row[27].blank?))
    $companyComments.push("#{row[27]}")
  end
end

response2.values.each do |row|
  if (!(row[0].blank?))
    $fund2015Q3.push("#{row[0]}")
  end

  if (!(row[1].blank?))
    $fund2015Q4.push("#{row[1]}")
  end

  if (!(row[2].blank?))
    $fund2016Q1.push("#{row[2]}")
  end

  if (!(row[3].blank?))
    $fund2016Q2.push("#{row[3]}")
  end

  if (!(row[4].blank?))
    $fund2016Q3.push("#{row[4]}")
  end

  if (!(row[5].blank?))
    $fund2016Q4.push("#{row[5]}")
  end
end

$fund2015Q3.each do |lol|
  puts lol
end

