import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['searchForm']

  showSearch(event) {
    event.preventDefault();

    let searchFormClassList = this.searchFormTarget.classList

    if (searchFormClassList.contains('d-none')) {
      searchFormClassList.remove('d-none');
    } else {
      searchFormClassList.add('d-none');
    }
  }
}
