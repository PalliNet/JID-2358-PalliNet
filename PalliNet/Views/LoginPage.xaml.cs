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
        if (button.ClassId == "PhysicianLogin")
        {
            await Shell.Current.GoToAsync("physician");
        }
        else if (button.ClassId == "PatientLogin")
        {
            await Shell.Current.GoToAsync("patient");
        }
    }
}