class Charity < ActiveRecord::Base
  validates :charity_name, :first_name, :telephone_number,
           :last_name, :job_title, :i_agree_to_the, :description,
           :address_1, :state, :zip, :country,
           :website, :pick_a_category, presence: true 
  validates :email_address, format: { with: /(\S+)@(\S+)/ }
  belongs_to :city

    PICK_A_CATEGORY_OPTIONS = [ 
    'Aged',
    'Animal',
    'Armed & Ex-Services',
    'Children & Youth',
    'Community',
    'Culture & Heritage',
    'Disabled',
    'Education & Training',
    'Employment, Trades & Professions',
    'Environment',
    'Family',
    'Health',
    'Hearing Impairments',
    'Hospices',
    'Hospitals',
    'Housing',
    'Human Rights',
    'International',
    'Learning Disabilities & SEN',
    'Medical Research',
    'Medical Welfare',
    'Mental Health',
    'Overseas Aid',
    'Religious',
    'Rescue Services',
    'Social Welfare',
    'Sport & Recreation',
    'Visual Impairments',
    'Other'
  ]

  validates :pick_a_category, inclusion: { in: PICK_A_CATEGORY_OPTIONS }
end
