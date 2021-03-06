module UserHelper

	def view_user
		within(:xpath, "//div[@id='users']/table") do
      click_link('Show')
  	end
  end		

  def edit_user
		within(:xpath, "//*[@id='users']/table") do
      click_link('Edit')
  	end
  end

  def delete_user
    within(:xpath, '//*[@id="users"]/table/tbody/tr[1]') do
      click_button('Delete')
    end
  end

  def create_generic_user
    @role = FactoryGirl.create(:role)
    @user = FactoryGirl.create(:user, :role_id => @role.id)
  end

end

World(UserHelper)