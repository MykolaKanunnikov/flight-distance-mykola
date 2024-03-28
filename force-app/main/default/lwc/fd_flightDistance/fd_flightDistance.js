import { LightningElement, api } from 'lwc';
import getDistanceKm from '@salesforce/apex/FD_FlightDistanceController.getDistanceKm';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Fd_flightDistance extends LightningElement {
    @api departureAirportId;
    @api arrivalAriportId;
    @api distance;
    distanceText;

    hasDistance = false;
    isPageLoading = true;

    handlePickerReady() {
        this.isPageLoading = false;
    }

    handleDepartureChange(event) {
        if(!event.detail?.recordId) return;
        this.departureAirportId = event.detail.recordId;
        if (this.arrivalAriportId) {
            this.getDistance();
        }
    }

    handleArrivalChange(event) {
        if(!event.detail?.recordId) return;
        this.arrivalAriportId = event.detail.recordId;
        if (this.departureAirportId) {
            this.getDistance();
        }
    }

    getDistance() {
        getDistanceKm({departureAirportId: this.departureAirportId, arrivalAirportId: this.arrivalAriportId})
            .then(result => {
                if (result || result === 0) {
                    this.distanceText = `About ${result} km`;
                    this.distance = result; 
                    this.hasDistance = true;
                } else {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error',
                            message: 'Unexpected result of distance retrieval',
                            variant: 'error'
                        })
                    );    
                }
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            })
    }



}