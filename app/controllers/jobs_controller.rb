class JobsController < ApplicationController
  before_action :get_job

  def show
  end

  def run
    @job.run!
    redirect_to job_path
  end

  def sleep
    @job.sleep!
    redirect_to job_path
  end

  def clean
    @job.clean!
    redirect_to job_path
  end

  def alarm
    @job.alarm!
    redirect_to job_path
  end

  def fix
    @job.fix!
    redirect_to job_path
  end

  private

    def get_job
      @job = @@job ||= Job.new
    end
end
