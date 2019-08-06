50.times do
  Product.create({
    product_name: Faker::Commerce.product_name,
    description:  Faker::Lorem.paragraph
  })
end
