document.addEventListener('alpine:init', () => {
  Alpine.data('quoteData', () => ({
    selectedCategory: '',
    loadedQuote: {},

    loadQuote() {
      fetch('./quotes/random')
        .then(response => response.json())
        .then(data => {
          this.selectedCategory = ''
          this.loadedQuote = data
        })
    },

    loadQuoteByCategory(category) {
      fetch(`./categories/${category}/quotes/random`)
        .then(response => response.json())
        .then(data => {
          this.selectedCategory = category
          this.loadedQuote = data
        })
    },

    refreshQuote() {
      if (this.selectedCategory) {
        this.loadQuoteByCategory(this.selectedCategory)
      } else {
        this.loadQuote()
      }
    },

    init() {
      this.loadQuote()
    }
  }))
})
