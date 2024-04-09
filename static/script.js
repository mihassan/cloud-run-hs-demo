document.addEventListener('alpine:init', () => {
  Alpine.data('quoteData', () => ({
    isLoaded: false,

    quote: '',
    author: '',
    category: '',

    populateQuote(data) {
      console.log(data)
      this.quote = data.quote
      this.author = data.author
      this.category = data.category
      this.isLoaded = true
    },

    loadQuote() {
      fetch('./quotes/random')
        .then(response => response.json())
        .then(data => this.populateQuote(data))
    },

    loadQuoteInSameCategory() {
      fetch(`./categories/${this.category}/quotes/random`)
        .then(response => response.json())
        .then(data => this.populateQuote(data))
    },

    init() {
      this.loadQuote()
    }
  }))
})
