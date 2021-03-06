class WorkoutsController < ApplicationController
  # GET /workouts
  # GET /workouts.xml
  def index
    @workouts = Workout.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workouts }
    end
  end

  # GET /workouts/1
  # GET /workouts/1.xml
  def show
    @workout = Workout.find(params[:id])
    @exercises = Exercise.find(:all)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workout }
    end
  end
  
  def add_exercise
    @workout = Workout.find(params[:id])
    @workout.exercises << Exercise.find(params[:exercise_id])
    if @workout.save
      flash[:notice] = "Exercise added successfully."
    else
      flash[:notice] = "Exercise not added!"
    end
    redirect_to workout_path(@workout)
  end

  def remove_exercise
    @workout = Workout.find(params[:id])
    @workout.workout_exercises.delete(WorkoutExercise.find(params[:workout_exercise_id]))
    if @workout.save
      flash[:notice] = "Exercise removed successfully."
    else
      flash[:notice] = "Exercise not removed!"
    end
    redirect_to workout_path(@workout)
  end

  # GET /workouts/new
  # GET /workouts/new.xml
  def new
    @workout = Workout.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workout }
    end
  end

  # GET /workouts/1/edit
  def edit
    @workout = Workout.find(params[:id])
  end

  # POST /workouts
  # POST /workouts.xml
  def create
    @workout = Workout.new(params[:workout])

    respond_to do |format|
      if @workout.save
        flash[:notice] = 'Workout was successfully created.'
        format.html { redirect_to(@workout) }
        format.xml  { render :xml => @workout, :status => :created, :location => @workout }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workouts/1
  # PUT /workouts/1.xml
  def update
    @workout = Workout.find(params[:id])

    respond_to do |format|
      if @workout.update_attributes(params[:workout])
        flash[:notice] = 'Workout was successfully updated.'
        format.html { redirect_to(@workout) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.xml
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to(workouts_url) }
      format.xml  { head :ok }
    end
  end
end
