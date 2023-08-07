module Transactions
  module Parsers
    ##
    # Parses a row from a Tangerine report
    #
    # Row format: Transaction date,Transaction,Name,Memo,Amount
    class Tangerine
      def parse(row:)
        {
          date: Date.strptime(row[0], '%m/%d/%Y'),
          description: row[2],
          category: row[3].match(/Category: (.*)/)[1],
          amount: row[4].to_d
        }
      end
    end
  end
end
