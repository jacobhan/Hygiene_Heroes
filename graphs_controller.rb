require "./quickstart"

class GraphsController < ApplicationController

  def flot
    @my_array = $companyCurrentValuation
    @my_array2 = [
            [1, 34],
            [2, 25],
            [3, 19],
            [4, 34],
            [5, 32],
            [6, 44]
        ]
  end

  def morris
  end

  def rickshaw
  end

  def chartjs
  end

  def chartist
  end

  def peity
  end

  def sparkline
  end

  def c3charts
  end

end
