$(function() {
  $('#sortable-portfolios').sortable({
    update: function(event, ui) {
      var sortedPortfolioIds = $(this).sortable('toArray', { attribute: 'data-portfolio-id' });
      $.ajax({
        url: '/portfolios/update_positions',
        method: 'POST',
        data: { portfolio_ids: sortedPortfolioIds },
        dataType: 'script'
      });
    }
  });
});
