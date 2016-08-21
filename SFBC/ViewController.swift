import UIKit
import MapKit

class ViewController: UIViewController {

    let initialLocation = CLLocation(latitude: 37.769630, longitude: -122.451434)
    let regionRadius: CLLocationDistance = 1000

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        centerMapOnLocation(location: initialLocation)
        loadSupervisorInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func loadSupervisorInfo() {
        guard let url = Bundle.main.url(forResource: "supervisor_districts", withExtension: "json", subdirectory: "") else {
            return
        }


        do {
            let data = try Data(contentsOf: url, options: .alwaysMapped)
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            print(json)

        } catch {
            print("Something went wrong!")
        }

    }

    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }


}

