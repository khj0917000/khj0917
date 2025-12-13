SELECT *
FROM `project-9f416757-b7a0-4248-903.MDL_dataset.amazon`
LIMIT 10;

#신뢰할 수 있는 상품 찾기 (평점 & 리뷰)
#이미 검증된 상품 / 메인 페이지 “추천 상품”으로 적합
SELECT
  product_id,
  product_name,
  category,
  rating,
  rating_count,
  discount_percentage,
  discounted_price
FROM `MDL_dataset.amazon`
WHERE
  SAFE_CAST(rating AS FLOAT64) IS NOT NULL
  AND SAFE_CAST(rating AS FLOAT64) >= 4.0
  AND rating_count >= 100
ORDER BY SAFE_CAST(rating AS FLOAT64) DESC, rating_count DESC
LIMIT 20;
