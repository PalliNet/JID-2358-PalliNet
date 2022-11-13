namespace PalliNet.Views;

public partial class PatientLoginPage : ContentPage
{
	public PatientLoginPage()
	{
		InitializeComponent();
	}

    async void OnButtonClicked(object sender, EventArgs e)
    {
        Button button = sender as Button;
        if (button.ClassId == "Login")
        {
            Console.WriteLine("Login Not implemented yet");
            //await Shell.Current.GoToAsync("///PhysicianLogin");
        }
        else if (button.ClassId == "Return")
        {
            await Shell.Current.GoToAsync("///LoginPage");
        } else if (button.ClassId == "NewUser")
        {
            await Shell.Current.GoToAsync("///NewUserPage");
        }
    }
}