variable testvar {
  type = object({
    nouns      = list(string),
    adjectives = list(string),
  })

  description = "A word pool from mad list"

  validation {
    condition     = length(var.testvar["nouns"]) >= 11
    error_message = "at least 11 nounds are needed"
  }
}
