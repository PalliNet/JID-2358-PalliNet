namespace PalliNet.Views;

public partial class NewUserPage : ContentPage
{
	public NewUserPage()
	{
		InitializeComponent();
	}

    async void OnButtonClicked(object sender, EventArgs e)
    {
        Button button = sender as Button;
        String type = button.ClassId;
        if (type == "Referral")
        {
            Console.WriteLine("Referral Not implemented yet");
            //await Shell.Current.GoToAsync("///PhysicianLogin");
        } else if (type == "LocalSearch") {
            Console.WriteLine("LocalSearch Not implemented yet");
        } else if (type == "Return")
        {
            await Shell.Current.GoToAsync("..");
        }
    }
}