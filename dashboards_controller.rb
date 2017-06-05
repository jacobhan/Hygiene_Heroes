require "./quickstart"

class DashboardsController < ApplicationController
  def dashboard_1
    # @companyNumbers = $companyNumbers
    # @howManyCompanies = $howManyCompanies

    # @companyNames = $companyNames
    # @legalNames = $legalNames
    # @companyRanks = $companyRanks
    # @companyInvestDate = $companyInvestDate
    # @companySecurityType = $companySecurityType
    # @companyRoundSize = $companyRoundSize
    @companyRoundSizeAdjusted = $companyRoundSizeAdjusted
    # @companyAmountInvested = $companyAmountInvested
    # @companyAmountInvestedAdjusted = $companyAmountInvestedAdjusted
    # @companyCurrentValue = $companyCurrentValue
    # @companyCurrentValueAdjusted = $companyCurrentValueAdjusted
    @companyGainLossAdjusted = $companyGainLossAdjusted
    @companyNumShares = $companyNumShares
    # @companyInitialPPS = $companyInitialPPS
    # @companyCurrentPPS = $companyCurrentPPS
    # @companyCap = $companyCap
    @companyCurrentValuation = $companyCurrentValuation
    # @howManyCompanies = $howManyCompanies
    # @companyComments = $companyComments
  end

  def dashboard_2
  end

  def dashboard_3
    @extra_class = "sidebar-content"
  end

  def dashboard_4
    render :layout => "layout_2"
  end

  def dashboard_4_1
  end

  def dashboard_5
  end

end
