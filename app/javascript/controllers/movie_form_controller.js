import { Controller } from "@hotwired/stimulus"
import Inputmask from "inputmask"

export default class extends Controller {
  static targets = ['runtime', 'imdbRating']

  connect() {
    Inputmask({
      alias: "numeric", allowMinus: false, suffix: " minutes",
      rightAlign: false, showMaskOnHover: false
    }).mask(this.runtimeTarget);
    Inputmask({
      alias: "numeric", digits: 1, allowMinus: false, min: 0, max: 10,
      rightAlign: false, showMaskOnHover: false
    }).mask(this.imdbRatingTarget);
  }
}
