class Party < ApplicationRecord

  enum :status, { pending: 0, accepted: 1, declined: 3 }
end
