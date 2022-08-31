describe('visit homepage', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("Adds item to cart when 'Add to Cart' button is clicked", () => {
    cy.get(".cart article").should("have.length", +1);
  });

  it("There is a cart page", () => {
    cy.visit("http://localhost:3000/cart")
  });

  it("There are items in the cart", () => {
    cy.get(".products article").should("be.visible");
  });
})