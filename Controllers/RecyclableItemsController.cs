using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RecyclingApp.Models;

namespace RecyclingApp.Controllers
{
    public class RecyclableItemsController : Controller
    {
        private RecyclableDBEntities db = new RecyclableDBEntities();

        // GET: RecyclableItems
        public ActionResult Index()
        {
            var recyclableItem = db.RecyclableItem.Include(r => r.RecyclableType);
            return View(recyclableItem.ToList());
        }

        // GET: RecyclableItems/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecyclableItem recyclableItem = db.RecyclableItem.Find(id);
            if (recyclableItem == null)
            {
                return HttpNotFound();
            }
            return View(recyclableItem);
        }

        // GET: RecyclableItems/Create
        public ActionResult Create()
        {
            var recyclableTypes = db.RecyclableType.ToList();

            ViewBag.RecyclableTypes = recyclableTypes;

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,RecyclableTypeId,Weight,ComputedRate,ItemDescription")] RecyclableItem recyclableItem)
        {
            if (ModelState.IsValid)
            {
                db.RecyclableItem.Add(recyclableItem);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.RecyclableTypes = db.RecyclableType.ToList();
            return View(recyclableItem);
        }

        // GET: RecyclableItems/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecyclableItem recyclableItem = db.RecyclableItem.Find(id);
            if (recyclableItem == null)
            {
                return HttpNotFound();
            }

            ViewBag.RecyclableTypes = db.RecyclableType.ToList();

            ViewBag.RecyclableTypeId = new SelectList(db.RecyclableType, "Id", "Type", recyclableItem.RecyclableTypeId);
            return View(recyclableItem);
        }

        // POST: RecyclableItems/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,RecyclableTypeId,Weight,ComputedRate,ItemDescription")] RecyclableItem recyclableItem)
        {
            if (ModelState.IsValid)
            {
                db.Entry(recyclableItem).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.RecyclableTypeId = new SelectList(db.RecyclableType, "Id", "Type", recyclableItem.RecyclableTypeId);
            return View(recyclableItem);
        }

        // GET: RecyclableItems/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecyclableItem recyclableItem = db.RecyclableItem.Find(id);
            if (recyclableItem == null)
            {
                return HttpNotFound();
            }
            return View(recyclableItem);
        }

        // POST: RecyclableItems/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RecyclableItem recyclableItem = db.RecyclableItem.Find(id);
            db.RecyclableItem.Remove(recyclableItem);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
