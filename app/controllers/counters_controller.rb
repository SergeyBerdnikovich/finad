class CountersController < ApplicationController

  # GET /counters
  # GET /counters.json
  def index
    @counter = Counter.all
    if @counter.size == 0
       @counter = Counter.new()
       @counter.count = 31532
       @counter.save
    else
      @counter = @counter.first
      @counter.update_attribute("count", @counter.count + 1)
    end

    respond_to do |format|
      format.html {render :layout => false }# index.html.erb
      format.json { render json: @counters }
    end
  end

end
