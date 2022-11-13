namespace PalliNet.Views;

public partial class PhysicianLoginPage : ContentPage
{
	public PhysicianLoginPage()
	{
		InitializeComponent();
	}

    async void OnButtonClicked(object sender, EventArgs e)
    {
        Button button = sender as Button;
        if (button.ClassId == "Return")
        {
            await Shell.Current.GoToAsync("///LoginPage");
        }
    }

    async void OnLoginAttempt(object sender, EventArgs e )
    {
        Console.WriteLine("Login authentication not implemented");
        await Shell.Current.GoToAsync("///PhysicianHome");
    }

}