module Vocab
  def self.set
    %w(
      ShopBuy
      ShopSell
      ShopCancel
      Possession
      ExpTotal 
      ExpNext 
      SaveMessage 
      LoadMessage
      File
      PartyName
      Emerge
      Preemptive
      Surprise
      EscapeStart
      EscapeFailure
      Victory
      Defeat
      ObtainExp
      ObtainGold
      ObtainItem
      LevelUp
      ObtainSkill
      UseItem
      CriticalToEnemy
      CriticalToActor
      ActorDamage
      ActorRecovery
      ActorGain
      ActorLoss
      ActorDrain
      ActorNoDamage
      ActorNoHit
      EnemyDamage
      EnemyRecovery
      EnemyGain
      EnemyLoss
      EnemyDrain
      EnemyNoDamage
      EnemyNoHit
      Evasion
      MagicEvasion
      MagicReflection
      CounterAttack
      Substitute
      BuffAdd
      DebuffAdd
      BuffRemove
      ActionFailure
      PlayerPosError
      EventOverflow
      ).each do |const_name|
        const_set const_name, t("basic.#{const_name.underscore}")
    end
  end

  set
  I18n.on_reload(&method(:set).to_proc)
  
  # Currency Unit
  def self.currency_unit
    t 'basic.currency_unit'
  end
end