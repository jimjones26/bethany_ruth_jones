class User < ActiveRecord::Base
	has_secure_password
	before_save { email.downcase! }
	before_create :create_remember_token

	validates :first_name, presence: true, length: { maximum: 20 }
	validates :last_name, presence: true, length: { maximum: 20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }, confirmation: true, presence: true, :if => :password_required?


	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

	protected
		# Checks whether a password is needed or not. For validations only.
      	# Passwords are always required if it's a new record, or if the password
      	# or confirmation are being set somewhere.
      	def password_required?
      		!persisted? || !password.nil? || !password_confirmation.nil?
      	end

	#******* PRIVATE METHODS *******
	private

	def create_remember_token
		self.remember_token = User.hash(User.new_remember_token)
	end

end