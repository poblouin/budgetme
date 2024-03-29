module Transactions
  module Parsers
    ##
    # Parses a row from a Tangerine report
    #
    # Row format: Transaction date,Transaction,Name,Memo,Amount
    class Tangerine
      def parse(row:)
        category = row[3]&.match(/Category: (.*)/).to_a[1]
        category = TransactionCategory::UNCATEGORIZED if !category || category == 'Other'

        {
          date: Date.strptime(row[0], '%m/%d/%Y'),
          merchant_name: row[2],
          category:,
          amount: row[4].to_d
        }
      end
    end
  end
end
