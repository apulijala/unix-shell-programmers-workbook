variable "sns_topic_name" {
  description = "topic for billing"
  default     = "arvind_billing_topic" # Change arvind to your first name. 
}

variable "phone_number" {
  description = "Phone Number"
  default     = "+447375675019" # Change it to your number.
}

variable "billing_total" {
  description = "total of billing"
  default     = "1" # India change to rupees you want.
}

variable "currency" {
  description = "Enter your currency"
  default     = "USD" # Change to INR or GBP
}

