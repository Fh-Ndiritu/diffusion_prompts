import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dataset"
export default class extends Controller {
  static targets = ["splitLink"]
  
  connect() {
    this.splitLinkTarget.classList.add("active")
  }

  toggleActive(e) {
    this.splitLinkTargets.forEach(link => { 
      link.classList.remove("active")
    });
    e.target.classList.add("active")
  }
}

