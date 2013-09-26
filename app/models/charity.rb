class Charity < ActiveRecord::Base

   before_save { self.email_address = email_address.downcase } 
  validates :charity_name, :first_name, :telephone_number, :user_id,
           :last_name, :job_title, :i_agree_to_the, :description,
           :address_1, :state, :zip, :country,
           :website, :pick_a_category, presence: true 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :charity_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }

  belongs_to :user
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
