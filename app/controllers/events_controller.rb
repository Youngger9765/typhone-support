class EventsController < ApplicationController

	before_action :set_event, :only => [ :show, :edit, :update, :destroy]

	def index
  		@events = Event.order("id DESC").page(params[:page]).per(5)

  		if params[:event_id]
  			@event = Event.find( params[:event_id] )
  		else
			@event = Event.new
  		end

	end

	def show
  		
	end

	def new
  		@event = Event.new
	end

	def create
	  @event = Event.new(event_params)
	  if @event.save
	  	flash[:notice] = "event was successfully created"
	    redirect_to events_url
	  else
	    render :action => :new
	  end
	end

	def edit
  		
	end

	def update
	  if @event.update(event_params)
	  	flash[:notice] = "event was successfully updated"
	    redirect_to event_url(@event)
	  else
	    render :action => :edit
	  end
	end


	def destroy
  	
  		@event.destroy
  		flash[:alert] = "event was successfully deleted"
  		redirect_to events_url
	end






	private

	def event_params
	  params.require(:event).permit(:name, :description, :content, :category_id)
	end

	def set_event
  		@event = Event.find(params[:id])
	end


end
