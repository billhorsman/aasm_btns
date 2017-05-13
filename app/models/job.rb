class Job
  include AASM
  include ActiveModel::Model

  aasm do
    state :sleeping, initial: true
    state :running, :cleaning, :broken

    event :run do
      transitions from: :sleeping, to: :running
    end

    event :clean do
      transitions from: :running, to: :cleaning
    end

    event :sleep do
      transitions from: [:running, :cleaning], to: :sleeping
    end

    event :alarm do
      transitions from: [:running], to: :broken
    end

    event :fix do
      transitions from: [:broken], to: :sleeping
    end
  end

  def operator_events
    aasm.events(possible: true).map(&:name) & %i[run clean sleep fix]
  end

  def persisted?
    true
  end
end
