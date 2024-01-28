import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["submit"]
  connect() {
    this.submitTarget.disabled = true
  }

  queryChange(e) {
    if (e.target.value.trim().length > 1) {
      this.submitTarget.disabled = false
    } else {
      this.submitTarget.disabled = true
    }
  }

}
