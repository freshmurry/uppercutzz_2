class PagesController < ApplicationController
  def home
    @barbershops = Barbershop.where(active: true).limit(3)
  end

  def search
    # STEP 1
    if params[:search].present? && params[:search].strip != ""
      session[:loc_search] = params[:search]
    end

    # STEP 2
    if session[:loc_search] && session[:loc_search] != ""
      @barbershops_address = Barbershop.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      @barbershops_address = Barbershop.where(active: true).all
    end

    # STEP 3
    @search = @barbershops_address.ransack(params[:q])
    @barbershops = @search.result

    @arrBarbershops = @barbershops.to_a

    # STEP 4
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? &&  !params[:end_date].empty?)
      
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @barbershops.each do |barbershop|

        not_available = barbershop.reservations.where(
          "((? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date))
          AND status = ?",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date,
          1
        ).limit(1)
        
        not_available_in_calendar = Calendar.where(
          "barbershop_id = ? AND status = ? AND day <= ? AND day >= ?",
          barbershop.id, 1, end_date, start_date
        ).limit(1)
        
        
        if not_available.length > 0 || not_available_in_calendar.length > 0
          @arrBarbershops.delete(barbershop)
        end
      end
    end

  end
end