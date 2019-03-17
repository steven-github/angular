import { Injectable } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class HolidayApiService {

  constructor(private http: HttpClient) { }

  // private _apiURL = 'https://holidayapi.com/v1/holidays?key=12ed68aa-eebb-4c0b-a37b-6d3202de35ef';
  private _apiURL = 'https://holidayapi.pl/v1/holidays';

  getHolidays(info) {
    const month = info.date.getMonth() + 1;
    const year = info.date.getFullYear();
    const params = new HttpParams()
      .set('country', info.country)
      // .set('month', month)
      .set('year', year);
    return this.http.get(this._apiURL, { responseType: 'json', params });
  }
}
