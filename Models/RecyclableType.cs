//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RecyclingApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RecyclableType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RecyclableType()
        {
            this.RecyclableItem = new HashSet<RecyclableItem>();
        }
    
        public int Id { get; set; }
        public string Type { get; set; }
        public decimal Rate { get; set; }
        public decimal MinKg { get; set; }
        public decimal MaxKg { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RecyclableItem> RecyclableItem { get; set; }
    }
}
