using Microsoft.Maui.Controls.Xaml;

namespace PalliNet.Components;

public partial class StartCard : ContentView
{
	public StartCard()
	{
		InitializeComponent();
	}

	async void OnButtonClicked(object sender, EventArgs e)
	{
        await Shell.Current.GoToAsync("///LoginPage");
    }
}