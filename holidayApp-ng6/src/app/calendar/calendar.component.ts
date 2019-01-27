import { Component, OnInit, Input } from '@angular/core';
// import * as $ from 'jquery';
import * as moment from 'moment';
declare var $: any; declare var jQuery: any;

@Component({
  selector: 'app-calendar',
  templateUrl: './calendar.component.html',
  styleUrls: ['./calendar.component.css']
})
export class CalendarComponent implements OnInit {

  @Input() info: any;

  constructor() { }

  ngOnInit() {
    const startDate = moment(this.info.date).format('MM/DD/YYYY');
    const endDate = moment(this.info.date).add(this.info.days, 'day').format('MM/DD/YYYY');
    const holidays = this.info.api.holidays;
    $(document).ready(function () {
      $('.daterange-container').daterangepicker({
        startDate: startDate,
        endDate: endDate,
        minDate: startDate,
        maxDate: endDate,
        parentEl: '.daterange',
        holidays: holidays
    }, function (start, end, label) {
        console.log('predefined range: ', label);
    }).trigger('click');
    // $('[data-toggle="tooltip"]').tooltip();
    });
  }

}
