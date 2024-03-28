import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class Fd_redirect extends NavigationMixin(LightningElement) {

    @api recordId;
    @api objectApiName;

    connectedCallback() {
        this[NavigationMixin.Navigate] ({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: this.objectApiName,
                actionName: 'view'
            },
        })
    }
}