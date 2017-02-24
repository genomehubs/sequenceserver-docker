module SequenceServer
  class Hierarchy
    class << self

      def default
        arr = [
          {:id=>1,  :title=>"Trichoptera",   :parent_id=>nil},
          {:id=>2,  :title=>"Lepidoptera",   :parent_id=>nil},
          {:id=>3,  :title=>"Limnephilus",   :parent_id=>1},
          {:id=>4,  :title=>"Moths",         :parent_id=>2},
          {:id=>5,  :title=>"Butterflies",   :parent_id=>2},
          {:id=>6,  :title=>"Agraulis",      :parent_id=>20},
          {:id=>7,  :title=>"Bicyclus",      :parent_id=>5},
          {:id=>8,  :title=>"Danaus",        :parent_id=>5},
          {:id=>9,  :title=>"Dryas",         :parent_id=>20},
          {:id=>10, :title=>"Euides",        :parent_id=>20},
          {:id=>11, :title=>"Heliconius",    :parent_id=>20},
          {:id=>12, :title=>"Hepialus",      :parent_id=>20},
          {:id=>13, :title=>"Laparus",       :parent_id=>20},
          {:id=>14, :title=>"Lerema",        :parent_id=>5},
          {:id=>15, :title=>"Melitaea",      :parent_id=>5},
          {:id=>16, :title=>"Neruda",        :parent_id=>20},
          {:id=>17, :title=>"Papilio",       :parent_id=>5},
          {:id=>18, :title=>"Phoebis",       :parent_id=>5},
          {:id=>19, :title=>"Polygonia",     :parent_id=>5},
          {:id=>20, :title=>"Heliconiinae",  :parent_id=>5},
          {:id=>21, :title=>"Amyelois",      :parent_id=>4},
          {:id=>22, :title=>"Bombyx",        :parent_id=>4},
          {:id=>23, :title=>"Calycopis",     :parent_id=>4},
          {:id=>24, :title=>"Chilo",         :parent_id=>4},
          {:id=>25, :title=>"Manduca",       :parent_id=>4},
          {:id=>26, :title=>"Operophtera",   :parent_id=>4},
          {:id=>27, :title=>"Plodia",        :parent_id=>4},
          {:id=>28, :title=>"Plutella",      :parent_id=>4},
          {:id=>29, :title=>"Callimorpha",   :parent_id=>4},
          {:id=>30, :title=>"Cameraria",     :parent_id=>4},
          {:id=>31, :title=>"Glyphotaelius", :parent_id=>4}
        ]
      end
    end
  end
end
