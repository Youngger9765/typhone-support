class EventFeedbacksController < ApplicationController

	before_action :set_event

	def index
		@feedbacks = @event.feedbacks
	end

	def show
		@feedback = @event.feedbacks.find( params[:id] )
	end

	def edit
		@feedback = @event.feedbacks.find( params[:id] )
	end

	def new
		@feedback = @event.feedbacks.build
	end

	def create
	  	@feedback = @event.feedbacks.build( feedback_params)

	  	if @feedback.save
	  		redirect_to event_feedbacks_path(@event)
	  	else
	  		render :action => "new"
	  	end
  	end

  	def destroy
	 
	  	@feedback = @event.feedbacks.find( params[:id] )
	  	@feedback.destroy

	  	redirect_to event_feedbacks_path(@event)
  	end

  	def update
	  	@feedback = @event.feedbacks.find( params[:id] )
	  	
	  	if @feedback.update( feedback_params )
	  		redirect_to event_feedbacks_path(@event)
	  	else
	  		render :action => "edit"
	  	end

  	end



	protected

	def set_event
		@event = Event.find( params[:event_id] )	
	end

	def feedback_params
  		params.require(:feedback).permit(:content)
  	end

end
