import { Component, OnInit } from "@angular/core";
import { CarsService } from "../services/cars.service";
import { Car } from "../car";

@Component({
  selector: "app-cars",
  templateUrl: "./cars.component.html",
  styleUrls: ["./cars.component.scss"]
})
export class CarsComponent implements OnInit {
  cars: Car[];
  error = "";
  success = "";

  constructor(private _carsService: CarsService) {}

  ngOnInit() {
    this.getCars();
  }

  getCars(): void {
    this._carsService.getAll().subscribe(
      (res: Car[]) => {
        this.cars = res;
      },
      err => {
        this.error = err;
      }
    );
  }
}
