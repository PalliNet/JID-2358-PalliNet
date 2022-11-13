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
        if (button.ClassId == "Login")
        {
            Console.WriteLine("Physician Login Not implemented yet");
            //await Shell.Current.GoToAsync("///PhysicianLogin");
        }
        else if (button.ClassId == "Return")
        {
            await Shell.Current.GoToAsync("///LoginPage");
        }
    }

}