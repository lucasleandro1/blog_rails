module PostsHelper
  def extract_name(email)
    name = email.gsub(/@gmail.com/, "")
    return name
  end
end