# Hnry NZ Income Tax Calculator

A small Rails app for calculating NZ individual income tax using the 2025 tax bands from the brief.

I kept the solution intentionally small:

- one controller
- one input/form object for validation
- one service object for the tax calculation
- one page to enter income and show the result
- no database

## Requirements

- Ruby 3.3.0
- Bundler

## Setup

```bash
bundle install
```

## Run

```bash
bin/rails server
```

Open `http://localhost:3000`.

## Test

```bash
bundle exec rspec
```

## What It Does

- accepts an annual income in NZD
- validates the input
- calculates tax progressively across the 2025 NZ income tax bands
- renders the calculated tax on the same page

## Implementation Notes

- Uses `BigDecimal` for the tax calculation to avoid floating-point issues.
- Includes simple validation for blank, non-numeric, and negative values.
- Uses no database.
- Includes service specs, model specs, and a request spec.

## Tax Bands

- 10.5% up to `$15,600`
- 17.5% from `$15,601` to `$53,500`
- 30% from `$53,501` to `$78,100`
- 33% from `$78,101` to `$180,000`
- 39% over `$180,000`

## Example Values

| Income | Tax |
| --- | ---: |
| `$10,000` | `$1,050.00` |
| `$35,000` | `$5,033.00` |
| `$100,000` | `$22,877.50` |
| `$220,000` | `$64,877.50` |

## Assumptions

- The input is annual taxable income in NZD.
- The calculator only applies the tax bands from the brief.
- It does not include other deductions or adjustments.

## Source

https://www.ird.govt.nz/income-tax/income-tax-for-individuals/tax-codes-and-tax-rates-for-individuals/tax-rates-for-individuals
