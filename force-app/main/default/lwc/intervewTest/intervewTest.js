import { LightningElement, wire } from 'lwc';
import getAgentClients from '@salesforce/apex/AgentPortalController.getAgentClients';

export default class IntervewTest extends LightningElement {
    clients;
    error;
    
    @wire(getAgentClients)
    wiredClients({ error, data }) {
        if (data) {
            this.clients = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.clients = undefined;
        }
    }
}