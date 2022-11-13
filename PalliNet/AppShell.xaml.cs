namespace PalliNet;

public partial class AppShell : Shell
{
	public AppShell()
	{
		RegisterComponenets();
		InitializeComponent();
	}

	private void RegisterComponenets()
	{
        Routing.RegisterRoute("login/physician", typeof(Views.PhysicianLoginPage));
        Routing.RegisterRoute("login/patient", typeof(Views.PatientLoginPage));
		Routing.RegisterRoute("login/patient/new", typeof(Views.NewUserPage));

		Routing.RegisterRoute("home/physician", typeof(Views.PhysicianHomePage));
        Routing.RegisterRoute("home/patient", typeof(Views.PhysicianHomePage));
    }
}
