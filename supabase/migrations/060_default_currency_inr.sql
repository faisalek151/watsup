-- ============================================================
-- 060_default_currency_inr
--
-- Set INR (₹) as the default currency for newly created accounts
-- and deals in Watsup. Existing accounts and deals retain their
-- saved currency values.
-- ============================================================

ALTER TABLE public.accounts
  ALTER COLUMN default_currency SET DEFAULT 'INR';

ALTER TABLE public.deals
  ALTER COLUMN currency SET DEFAULT 'INR';
