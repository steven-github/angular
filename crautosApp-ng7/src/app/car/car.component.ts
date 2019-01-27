import { Component, OnInit } from "@angular/core";
import { ActivatedRoute } from "@angular/router";
import { CarsService } from "../services/cars.service";
import { Car } from "../car";
import { Location } from "@angular/common";

@Component({
  selector: "app-car",
  templateUrl: "./car.component.html",
  styleUrls: ["./car.component.scss"]
})
export class CarComponent implements OnInit {
  car: Car[];
  error = "";
  success = "";

  constructor(
    private _route: ActivatedRoute,
    private _carsService: CarsService,
    private _location: Location
  ) {}
  ngOnInit() {
    this.getCarById(this._route.snapshot.params.id);
  }

  getCarById(id: number): void {
    this._carsService.getById(id).subscribe(
      (res: Car[]) => {
        this.car = res;
      },
      err => {
        this.error = err;
      }
    );
  }

  goBack() {
    this._location.back();
  }
}
