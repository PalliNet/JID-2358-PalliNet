namespace PalliNet.Views;

public partial class LoginPage : ContentPage
{
	public LoginPage()
	{
        InitializeComponent();
    }

    async void OnButtonClicked(object sender, EventArgs e)
    {
        Button button = sender as Button;
        if (button.Text == "Physician Login")
        {
            await Shell.Current.GoToAsync("///PhysicianLogin");
        }
        else if (button.Text == "Patient Login")
        {
            await Shell.Current.GoToAsync("///PatientLogin");
        }
    }
}