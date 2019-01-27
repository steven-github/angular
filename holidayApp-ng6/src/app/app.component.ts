import { Component } from '@angular/core';
import { HolidayApiService } from './holiday-api.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor(private api: HolidayApiService) {}

  loading = false;
  loaded = false;

  countries = [
    { value: 'US', viewValue: 'US' }
  ];

  info = {
    date: new Date(),
    days: 20,
    country: this.countries[0].value,
    api: null
  };

  submit() {
    this.loaded = false;
    this.loading = true;
    this.api.getHolidays(this.info).subscribe(data => {
        // console.log('Success', data);
        this.info.api = data;
        this.loaded = true;
        this.loading = false;
      }, error => {
        // console.log('Error', error);
      });
  }

  reset() {
    this.loaded = false;
  }

}
